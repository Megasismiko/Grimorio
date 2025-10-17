using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Mvc;

namespace Grimorio.API.Controllers
{
    [Route("api/usuario")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;

        public UsuarioController(IUsuarioService usuarioService)
        {
            _usuarioService = usuarioService;
        }

        [HttpGet]
        [Route("lista")]
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
        [Route("login")]
        public async Task<IActionResult> Login([FromBody] LoginDTO login)
        {
            Response<SesionDTO> res = new();

            try
            {
                res.value = await _usuarioService.ValidarCredenciales(login.Correo, login.Clave);
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
    }
}
