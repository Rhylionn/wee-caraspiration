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
            //TextBox from = (TextBox)FindControl("from");
            //TextBox to = (TextBox)FindControl("to");
            //TextBox subject = (TextBox)FindControl("subject");
            //TextBox content = (TextBox)FindControl("content");
            //TextBox status = (TextBox)FindControl("status");

            SmtpClient client = new SmtpClient("smtp.mailfence.com", 465);
            client.UseDefaultCredentials = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;

            //to.Text, from.Text, subject.Text, content.Text

            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("user@email.com", "something");
            mail.To.Add(new MailAddress("contact.caraspiration@mailfence.com"));


            client.Send(mail);
        }
    }
