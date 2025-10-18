using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Mvc;

namespace Grimorio.API.Controllers
{
    [Route("api/sets")]
    [ApiController]
    public class SetsController : ControllerBase
    {
        private readonly ISetService _setService;

        public SetsController(ISetService setService)
        {
            _setService = setService;
        }

        [HttpGet]
        [Route("")]
        public async Task<IActionResult> Sets()
        {
            Response<List<SetDTO>> res = new();

            try
            {
                res.value = await _setService.GetSets();
            }
            catch (Exception ex)
            {
                res.status = false;
                res.msg = ex.Message;
            }

            return Ok(res);
        }

        [HttpGet]
        [Route("set/{id:int}")]
        public async Task<IActionResult> GetSetById(int id)
        {
            Response<SetDTO> res = new();

            try
            {
                res.value = await _setService.GetSetById(id);
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
        public async Task<IActionResult> Crear([FromBody] SetDTO set)
        {
            Response<SetDTO> res = new();

            try
            {
                res.value = await _setService.Crear(set);
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
        public async Task<IActionResult> Editar([FromBody] SetDTO set)
        {
            Response<bool> res = new();

            try
            {
                res.value = await _setService.Editar(set);
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
                res.value = await _setService.Eliminar(id);
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
