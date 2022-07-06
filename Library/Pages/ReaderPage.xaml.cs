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
using Library.Model;
namespace Library.Pages
{
    /// <summary>
    /// Логика взаимодействия для ReaderPage.xaml
    /// </summary>
    public partial class ReaderPage : Page
    {
        public ReaderPage()
        {
            InitializeComponent();
            DGClient.ItemsSource = DB.DbConnection.connection.ReaderCard.Where(r=>r.IsBlock == false).ToList();
        }

        private void addReaderBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ClientCardPage());
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
        private void DGClient_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedReaderCard = DGClient.SelectedItem as ReaderCard;
            NavigationService.Navigate(new ClientCardPage(selectedReaderCard));
        }
    }
}
