namespace CircularLogic.Models
{
    public class User
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsDeleted { get; set; }
        public bool Deny { get; set; }
    }
}