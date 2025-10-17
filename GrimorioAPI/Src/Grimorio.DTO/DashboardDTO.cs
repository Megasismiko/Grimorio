namespace Grimorio.DTO
{
    public class DashboardDTO
    {
        public int TotalVentas{ get; set; }
        public string? TotalIngresos { get; set; }
        public List<VentasSemanaDTO> VentasUltimaSemana { get; set; } = new List<VentasSemanaDTO>();
        public int TotalProductos { get; set; }
    }
}
