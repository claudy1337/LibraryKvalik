using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

using Library.DB;
using Library.Model;
using System.Collections.ObjectModel;

namespace Library.Pages
{
    public partial class DebtorsPage : Page
    {
        private static IEnumerable<TurnOver> turnOvers { get; set; }
        private static IEnumerable<TurnOver> turnOvers1 { get; set; }
        public DebtorsPage()
        {
            InitializeComponent();
            var debtors = new List<Debtor>();
            turnOvers = Methods.GetTurnOvers().Where(x => x.DateReturn != null);
            turnOvers1 = Methods.GetTurnOvers().Where(x => x.DateReturn == null);
            foreach (var turnOver in turnOvers)
            {
                Debtor debtor = new Debtor()
                {
                    Surname = turnOver.ReaderCard.Surname,
                    FirstName = turnOver.ReaderCard.FirstName,
                    BookName = turnOver.Book.Title,
                    Responsible = turnOver.Employee.Surname,
                    Days = turnOver.DateReturn.Value.Subtract(turnOver.DateIssue.Value).Days,
                };
                if (debtor.Days > 30)
                    debtors.Add(debtor);
            }
            foreach (var turnOver in turnOvers1)
            {
                Debtor debtor = new Debtor()
                {
                    Surname = turnOver.ReaderCard.Surname,
                    FirstName = turnOver.ReaderCard.FirstName,
                    BookName = turnOver.Book.Title,
                    Responsible = turnOver.Employee.Surname,
                    Days = DateTime.Now.Subtract(turnOver.DateIssue.Value).Days,
                };
                if (debtor.Days > 30)
                    debtors.Add(debtor);
            }
            DGDebtors.ItemsSource = debtors;
            this.DataContext = this;
        }

        private void readerPageBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderPage());
        }

        private void bookPageBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BooksPage());
        }

        private void debtorPageBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new DebtorsPage());
        }

        private void DGDebtors_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
