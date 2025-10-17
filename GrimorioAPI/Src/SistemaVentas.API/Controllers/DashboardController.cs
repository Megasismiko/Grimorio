using Grimorio.API.Utilidad;
using Grimorio.BLL.Servicios.Contrato;
using Grimorio.DTO;
using Microsoft.AspNetCore.Mvc;

namespace Grimorio.API.Controllers
{
    [Route("api/dashboard")]
    [ApiController]
    public class DashboardController : ControllerBase
    {

        private readonly IDashboardService _dashboardService;

        public DashboardController(IDashboardService dashboardService)
        {
            _dashboardService = dashboardService;
        }


        [HttpGet]
        [Route("resumen")]
        public async Task<IActionResult> Resumen()
        {
            Response<DashboardDTO> res = new();

            try
            {
                res.value = await _dashboardService.Resumen();
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
