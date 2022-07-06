using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DB
{
    internal class Debtor
    {
        public string Surname { get; set; }
        public string FirstName { get; set; }
        public string BookName { get; set; }
        public string Responsible { get; set; }
        public int Days { get; set; }
    }
}
