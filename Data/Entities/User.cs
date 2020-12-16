using System;

namespace Data.Entities
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public DateTime? Birthdate { get; set; }
    }
}
