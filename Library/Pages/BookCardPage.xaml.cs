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
namespace Library.Pages
{
    /// <summary>
    /// Логика взаимодействия для BookCardPage.xaml
    /// </summary>
    public partial class BookCardPage : Page
    {
        private static bool IsEditing = false;
        private static Book CurrentBoockCard;
        public BookCardPage(Book book)
        {
            InitializeComponent();
            CurrentBoockCard = book;
            name_txt.Text = CurrentBoockCard.Title;
            author_txt.Text = CurrentBoockCard.Author;
            year_txt.Text = CurrentBoockCard.YearPublishing.ToString();
            publisher_txt.Text = CurrentBoockCard.Pulbisher;
            theme_txt.Text = CurrentBoockCard.Theme.Title;
            amount_txt.Text = CurrentBoockCard.Count.ToString();
            IsEditing = false;
            addBtn.Content = "Редактировать";
            deleteBtn.IsEnabled = false;
        }
        public BookCardPage()
        {
            InitializeComponent();
            IsEditing = false;
            addBtn.Content = "Добавить";
            deleteBtn.IsEnabled = false;
        }

        private void backBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BooksPage());
        }

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void deleteBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(name_txt.Text) && string.IsNullOrEmpty(theme_txt.Text))
                {
                    MessageBox.Show("incorrect");
                    return;
                }
                else
                {
                    var book = DbConnection.connection.Book.Where(c => c.Title == CurrentBoockCard.Title && c.Author == CurrentBoockCard.Author && c.YearPublishing == CurrentBoockCard.YearPublishing).FirstOrDefault();
                    if (book != null)
                    {
                        book.IsRestrictions = true;
                        DbConnection.connection.SaveChanges();
                        MessageBox.Show("deleted");
                        NavigationService.Navigate(new BooksPage());
                    }
                }
               
            }
            catch(Exception)
            {
                MessageBox.Show("");
                return;
            }
            
        }
    }
}
