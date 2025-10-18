using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Mvc;

namespace Grimorio.API.Controllers
{
    [Route("api/roles")]
    [ApiController]
    public class RolesController : ControllerBase
    {

        private readonly IRolService _rolService;

        public RolesController(IRolService rolService)
        {
            _rolService = rolService;
        }

        [HttpGet]
        [Route("lista")]
        public async Task<IActionResult> Lista()
        {
            Response<List<RolDTO>> res = new();

            try
            {
                res.value = await _rolService.Lista();
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
