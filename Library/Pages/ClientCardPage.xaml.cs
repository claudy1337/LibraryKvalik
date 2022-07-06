using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для ClientCardPage.xaml
    /// </summary>
    public partial class ClientCardPage : Page
    {
        private static ReaderCard CurrentReaderCard;
        private static bool IsEditing = false;
        public ClientCardPage()
        {
            InitializeComponent();
        }
        public ClientCardPage(ReaderCard readerCard)
        {
            InitializeComponent();
            addBtn.Content = "Редактировать";
            IsEditing = true;
            deleteBtn.IsEnabled = true;
            CurrentReaderCard = readerCard;
            surname_txt.Text = readerCard.Surname;
            name_txt.Text = readerCard.FirstName;
            patronymic_txt.Text = readerCard.Patronymic;
            address_txt.Text = readerCard.Address;
            phone_txt.Text = readerCard.Phone;
            isBloked_cb.IsChecked = !readerCard.IsBlock;
        }

        private void backBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ReaderPage());
        }

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(surname_txt.Text) && string.IsNullOrWhiteSpace(name_txt.Text)&& string.IsNullOrWhiteSpace(phone_txt.Text))
            {
                MessageBox.Show("incorrect");
                return;

            }
            else if(!IsEditing)
            {
                ReaderCard readerCard = new ReaderCard()
                {
                    Surname = surname_txt.Text,
                    FirstName = name_txt.Text,
                    Patronymic = patronymic_txt.Text,
                    Address = address_txt.Text,
                    Phone = phone_txt.Text,
                    IsBlock = false,
                };
                DbConnection.connection.ReaderCard.Add(readerCard);
                DbConnection.connection.SaveChanges();
                MessageBox.Show("add");
                NavigationService.Navigate(new ReaderPage());
            }
            else if(IsEditing)
            {
                var clients = DbConnection.connection.ReaderCard.Where(c=>c.Surname == CurrentReaderCard.Surname && c.Address == CurrentReaderCard.Address).FirstOrDefault();
                if (clients != null)
                {
                    clients.Surname = surname_txt.Text;
                    clients.FirstName = name_txt.Text;
                    clients.Patronymic = patronymic_txt.Text;
                    clients.Address = address_txt.Text;
                    clients.Phone = phone_txt.Text;
                    DbConnection.connection.SaveChanges();
                    MessageBox.Show("edit");
                    NavigationService.Navigate(new ReaderPage());
                }
                
            }
           
        }

        private void deleteBtn_Click(object sender, RoutedEventArgs e)
        {
            var clients = DbConnection.connection.ReaderCard.Where(c => c.Surname == CurrentReaderCard.Surname && c.Address == CurrentReaderCard.Address).FirstOrDefault();
            if (clients != null)
            {
                clients.IsBlock = true;
                DbConnection.connection.SaveChanges();
                MessageBox.Show("deleted");
                NavigationService.Navigate(new ReaderPage());
            }
                
        }

        private void num(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}
