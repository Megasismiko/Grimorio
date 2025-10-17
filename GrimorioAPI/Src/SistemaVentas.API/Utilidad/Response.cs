namespace Grimorio.API.Utilidad
{
    public class Response<T>
    {
        public bool? status { get; set; } = true;
        public T? value { get; set; }
        public string? msg { get; set; } = "success";
    }
}
