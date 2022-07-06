using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Library.DB;
using Library.Model;

namespace Library.Pages
{
    public partial class BooksPage : Page
    {
        public BooksPage()
        {
            InitializeComponent();
            LVBooks.ItemsSource = DbConnection.connection.Book.Where(b=>b.IsRestrictions == false).ToList();
        }

        private void LVBooks_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selecteditem = LVBooks.SelectedItem as Book;
            NavigationService.Navigate(new BookCardPage(selecteditem));
        }

        private void bookPageBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BooksPage());
        }

        private void readerPageBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderPage());
        }

        private void debtorPageBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new DebtorsPage());
        }
    }
}
