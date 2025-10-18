namespace Grimorio.DTO
{
    public class SesionDTO
    {
        public int IdUsuario { get; set; }

        public string? NombreCompleto { get; set; }

        public string? Correo { get; set; }
     
        public string? RolDescripcion { get; set; }

        public string Token { get; set; } = string.Empty;
        public DateTime Expira { get; set; }

    }
}
