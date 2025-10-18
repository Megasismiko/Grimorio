using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Grimorio.API.Controllers
{
    [Route("api/usuarios")]
    [ApiController]
    [Authorize]
    public class UsuariosController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;
        private readonly IConfiguration _config;

        public UsuariosController(
            IUsuarioService usuarioService,
            IConfiguration config
        )
        {
            _usuarioService = usuarioService;
            _config = config;
        }

        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] LoginDTO login)
        {
            var res = new Response<SesionDTO>();

            try
            {

                SesionDTO? sesion = await _usuarioService.Login(login);

                if (sesion is null)
                {
                    // 401: credenciales incorrectas
                    return Unauthorized(new Response<object>
                    {
                        status = false,
                        msg = "Credenciales incorrectas"
                    });
                }

                // Generar JWT con el rol en ClaimTypes.Role (usa RolDescripcion)
                (sesion.Token, sesion.Expira) = GenerarJwt(sesion);               

                res.value = sesion;
                return Ok(res);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
                return StatusCode(StatusCodes.Status500InternalServerError, res);
            }
        }


        [HttpGet]
        [Route("lista")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Lista()
        {
            Response<List<UsuarioDTO>> res = new();

            try
            {
                res.value = await _usuarioService.Lista();
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }       
     

        [HttpPost]
        [Route("crear")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Crear([FromBody] UsuarioDTO usuario)
        {
            Response<UsuarioDTO> res = new();

            try
            {
                res.value = await _usuarioService.Crear(usuario);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }

        [HttpPut]
        [Route("editar")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Editar([FromBody] UsuarioDTO usuario)
        {
            Response<bool> res = new();

            try
            {
                res.value = await _usuarioService.Editar(usuario);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }

        [HttpDelete]
        [Route("eliminar/{id:int}")]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> Eliminar(int id)
        {
            Response<bool> res = new();

            try
            {
                res.value = await _usuarioService.Eliminar(id);
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }


        private (string token, DateTime expires) GenerarJwt(SesionDTO sesion)
        {
            var jwt = _config.GetSection("Jwt");
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwt["Key"]!));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
            {
                new(JwtRegisteredClaimNames.Sub, sesion.Correo ?? string.Empty),
                new(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new(ClaimTypes.NameIdentifier, sesion.IdUsuario.ToString()),
                new(ClaimTypes.Name, sesion.NombreCompleto ?? sesion.Correo ?? string.Empty),
                new(ClaimTypes.Email, sesion.Correo ?? string.Empty),
                new(ClaimTypes.Role, string.IsNullOrWhiteSpace(sesion.RolDescripcion) ? "User" : sesion.RolDescripcion!)
            };

            var minutes = int.TryParse(jwt["ExpiresMinutes"], out var m) ? m : 60;
            var expires = DateTime.UtcNow.AddMinutes(minutes);

            var token = new JwtSecurityToken(
                issuer: jwt["Issuer"],
                audience: jwt["Audience"],
                claims: claims,
                expires: expires,
                signingCredentials: creds
            );

            return (new JwtSecurityTokenHandler().WriteToken(token), expires);
        }
    }
}
