using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Library.DB;
using Library.Model;

namespace Library.Pages
{
    public partial class AuthPage : Page
    {
        public Employee CurrentEmployee;
        public AuthPage()
        {
            InitializeComponent();
        }

        private void auth_btn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(login_txt.Text) || string.IsNullOrWhiteSpace(password_txt.Password))
                {
                    MessageBox.Show("Введите логин и пароль");
                    return;
                }
                else
                {
                    if (Methods.IsCorrectEmployee(login_txt.Text, password_txt.Password))
                    {
                        CurrentEmployee = Methods.GetEmployee(login_txt.Text, password_txt.Password);
                        NavigationService.Navigate(new ReaderPage());
                    }
                    else
                    {
                        MessageBox.Show("неверный логин или пароль");
                    }
                }
                
            }
            catch(Exception)
            {
                return;
            }
            
        }
    }
}
