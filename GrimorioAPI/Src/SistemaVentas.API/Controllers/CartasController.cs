using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Mvc;

namespace Grimorio.API.Controllers
{
    [Route("api/cartas")]
    [ApiController]
    public class CartasController : ControllerBase
    {
        private readonly ICartaService _cartaService;

        public CartasController(ICartaService cartaService)
        {
            _cartaService = cartaService;
        }
              

        [HttpGet]
        [Route("carta/{id:int}")]
        public async Task<IActionResult> GetCartaById(int id)
        {
            Response<CartaDTO> res = new();

            try
            {
                res.value = await _cartaService.GetCartaById(id);
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
        public async Task<IActionResult> Crear([FromBody] CartaDTO carta)
        {
            Response<CartaDTO> res = new();

            try
            {
                res.value = await _cartaService.Crear(carta);
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
        public async Task<IActionResult> Editar([FromBody] CartaDTO carta)
        {
            Response<bool> res = new();

            try
            {
                res.value = await _cartaService.Editar(carta);
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
                res.value = await _cartaService.Eliminar(id);
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
