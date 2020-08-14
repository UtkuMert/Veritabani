using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace G171210051_Proje
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void databaseDec(string komut)
        {

            try
            {
                string connstring = "Server=127.0.0.1; Port=5432; User Id=postgres; Password=e.1.2.3.; Database=HOSPITAL;";
                NpgsqlConnection connection = new NpgsqlConnection(connstring);
                connection.Open();


                NpgsqlCommand command = new NpgsqlCommand(komut, connection);
                command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception msg)
            {
                MessageBox.Show(msg.ToString());
                throw;
            }
        }

        private void doktorEkleButton_Click(object sender, EventArgs e)
        {
            string komut = " SELECT *from doktorekle(" + doktorIdTextBox.Text + "," + doktorUcretTextBox.Text + "," + doktorSifreTextBox.Text + "," + doktorBransTextBox.Text + ");";
            databaseDec(komut);
        }

        private void sekreterSifreButton_Click(object sender, EventArgs e)
        {
            string komut = " SELECT *from sifreGuncelle(" + sekreterSifreTextBox.Text + ");";
            databaseDec(komut);
        }

        private void silinecekHastaButton_Click(object sender, EventArgs e)
        {
            string komut = " SELECT *from hastaSil(" + silinecekHastaTextBox.Text + ");";
            databaseDec(komut);
        }

        private void hastaAramaButton_Click(object sender, EventArgs e)
        {
            richTextBox1.Clear();
            try
            {
                string connstring = "Server=127.0.0.1; Port=5432; User Id=postgres; Password=e.1.2.3.; Database=HOSPITAL;";
                NpgsqlConnection connection = new NpgsqlConnection(connstring);
                connection.Open();
                string komut = "SELECT * FROM " + '"' + "public" + '"' + '.' + '"' + "HASTA" + '"';
                NpgsqlCommand command = new NpgsqlCommand(komut, connection);
                NpgsqlDataReader dataReader = command.ExecuteReader();
                for (int i = 0; dataReader.Read(); i++)
                {
                    richTextBox1.Text += "Hasta Adi: " + dataReader[1].ToString() + "  Hasta Soyadi: " + dataReader[2].ToString() +"\n\n";
                }
                connection.Close();
            }
            catch (Exception msg)
            {
                MessageBox.Show(msg.ToString());
                throw;
            }
        }
    }
}
