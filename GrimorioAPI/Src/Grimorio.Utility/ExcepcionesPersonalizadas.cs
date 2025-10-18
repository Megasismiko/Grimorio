namespace Grimorio.Utility
{
    public class ValidationException : Exception
    {
        public ValidationException(string message) : base(message) { }
    }

    public class NotFoundException : Exception
    {
        public NotFoundException(string message) : base(message) { }
    }

    public class ConflictException : Exception
    {
        public ConflictException(string? message) : base(message) { }

        public ConflictException(string message, Microsoft.EntityFrameworkCore.DbUpdateException ex) : base(message, ex) { }
    }
}
