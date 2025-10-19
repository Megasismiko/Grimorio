namespace Grimorio.DTO
{
    public class CartaDTO
    {
        public int IdCarta { get; set; }

        public string? Nombre { get; set; }

        public int? IdSet { get; set; }

        public int? Stock { get; set; }

        public decimal? Precio { get; set; }

        public bool? EsActivo { get; set; }

        public string? DescripcionSet { get; set; }

        public string? Coste { get; set; }

        public string? Tipo { get; set; }

        public string? Rareza { get; set; }

        public string? Texto { get; set; }

        public string? Artista { get; set; }

        public string? Numero { get; set; }

        public string? Poder { get; set; }

        public string? Resistencia { get; set; }

        public string? ImagenUrl { get; set; }

    }
}
