//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Library.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class TurnOver
    {
        public int Id { get; set; }
        public int ReaderCardId { get; set; }
        public int BookId { get; set; }
        public int EmployeeId { get; set; }
        public Nullable<System.DateTime> DateIssue { get; set; }
        public Nullable<System.DateTime> DateReturn { get; set; }
    
        public virtual Book Book { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual ReaderCard ReaderCard { get; set; }
    }
}