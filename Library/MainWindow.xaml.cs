using System;
using System.Windows;

namespace Library
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            frame.NavigationService.Navigate(new Pages.AuthPage());
        }
    }
}
