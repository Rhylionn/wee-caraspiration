using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

    public partial class contact : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {}
        protected void send_click(object sender, EventArgs e) {

            //try
            //{
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("constantin.hentgen@gmail.com");
                    mail.To.Add("contact.caraspiration@mailfence.com");
                    mail.Subject = "test sending mail";
                    mail.Body = "<h1>This is a body</h1>";
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient("smtp.mailfence.com", 465))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential("constantin.hentgen@gmail.com", "KXzU#RjvS4H!!T9A8O&d8K60#&#8AW&^3gCD&e2p3P67J&@^Y6");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);

                    }
                }
            //}
            //catch (Exception ex)
            //{
            //    String test = ex;
            //}






            ////TextBox from = (TextBox)FindControl("from");
            ////TextBox to = (TextBox)FindControl("to");
            ////TextBox subject = (TextBox)FindControl("subject");
            ////TextBox content = (TextBox)FindControl("content");
            ////TextBox status = (TextBox)FindControl("status");

            //SmtpClient client = new SmtpClient("smtp.mailfence.com", 465);
            //client.UseDefaultCredentials = true;
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.EnableSsl = true;

            ////to.Text, from.Text, subject.Text, content.Text

            //MailMessage mail = new MailMessage();

            //mail.From = new MailAddress("user@email.com", "something");
            //mail.To.Add(new MailAddress("contact.caraspiration@mailfence.com"));


            //client.Send(mail);
        }
    }
