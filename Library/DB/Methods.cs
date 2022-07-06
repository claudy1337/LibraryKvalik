using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Collections.ObjectModel;
using Library.Model;

namespace Library.DB
{
    public class Methods
    {
        public static bool IsCorrectEmployee(string login, string password)
        {
            ObservableCollection<Employee> employees = new ObservableCollection<Employee>(DbConnection.connection.Employee);
            var currentEmployee = employees.Where(u => u.Login == login && u.Password == password).FirstOrDefault();
            return currentEmployee != null;
        }
        public static ObservableCollection<Employee> GetEmployees()
        {
            return new ObservableCollection<Employee>(DbConnection.connection.Employee);
        }
        public static Employee GetEmployee(int id)
        {
            return GetEmployees().FirstOrDefault(x => x.Id == id);
        }
        public static Employee GetEmployee(string login, string password)
        {
            return GetEmployees().FirstOrDefault(x => x.Login == login && x.Password == password);
        }




        public static ObservableCollection<ReaderCard> GetReaderCards()
        {
            return new ObservableCollection<ReaderCard>(DbConnection.connection.ReaderCard);
        }

        public static IEnumerable<ReaderCard> GetAvailableReaderCards()
        {
            return GetReaderCards().Where(x => x.IsBlock == false);
        }

        public static ReaderCard GetReaderCard(int id)
        {
            return GetReaderCards().FirstOrDefault(x => x.Id == id);
        }

        public static void AddReaderCard(ReaderCard readerCard)
        {
            DbConnection.connection.ReaderCard.Add(readerCard);
            DbConnection.connection.SaveChanges();
        }

        public static void EditReaderCard(ReaderCard oldReaderCard, string surname, string name, string patronymic, string address, string phone, bool isBlocked)
        {
            var readerCard = GetReaderCard(oldReaderCard.Id);
            readerCard.Surname = surname;
            readerCard.FirstName = name;
            readerCard.Patronymic = patronymic;
            readerCard.Address = address;
            readerCard.Phone = phone;
            readerCard.IsBlock = isBlocked;
            DbConnection.connection.SaveChanges();
        }

        public static void RemoveReaderCard(int id)
        {
            var readerCard = GetReaderCard(id);
            readerCard.IsBlock = true;
            DbConnection.connection.SaveChanges();
        }


        public static ObservableCollection<Book> GetBooks()
        {
            return new ObservableCollection<Book>(DbConnection.connection.Book);
        }


        public static Book GetBook(int id)
        {
            return GetBooks().FirstOrDefault(x => x.Id == id);
        }

        public static void AddBook(Book book)
        {
            DbConnection.connection.Book.Add(book);
        }

        public static void RemoveBook(int id)
        {
            var book = GetBook(id);
            book.IsRestrictions = true;
            DbConnection.connection.SaveChanges();
        }



        public static ObservableCollection<TurnOver> GetTurnOvers()
        {
            return new ObservableCollection<TurnOver>(DbConnection.connection.TurnOver);
        }
    }
}
