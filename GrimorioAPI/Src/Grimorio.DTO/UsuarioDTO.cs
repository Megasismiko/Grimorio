namespace Grimorio.DTO
{
    public class UsuarioDTO
    {
        public int IdUsuario { get; set; }

        public string? NombreCompleto { get; set; }

        public string? Correo { get; set; }

        public int? IdRol { get; set; }

        public string? Clave { get; set; }

        public bool? EsActivo { get; set; }

        public string? RolDescripcion { get; set; }


    }
}
