using System.Globalization;

namespace Grimorio.Utility
{
    public static class Culture
    {
        private static readonly CultureInfo _cultureInfo = new CultureInfo("es-ES");
        public static CultureInfo Current => _cultureInfo;
        public static string FormatoFecha => "dd/MM/yyyy";
    }
}
