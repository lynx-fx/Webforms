using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class movies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                MessagePanel.Visible = true;
                MessagePanel.CssClass = "alert alert-danger alert-dismissible fade show mb-4";

                if (e.Exception.Message.Contains("ORA-00001"))
                {
                    MessageLabel.Text = "<strong>Error:</strong> A movie with this ID already exists. Please use a different Ref #.";
                }
                else
                {
                    MessageLabel.Text = "<strong>Error:</strong> " + e.Exception.Message;
                }

                e.ExceptionHandled = true;
            }
            else
            {
                MessagePanel.Visible = true;
                MessagePanel.CssClass = "alert alert-success alert-dismissible fade show mb-4";
                MessageLabel.Text = "<strong>Success!</strong> New movie has been added to the inventory.";
            }
        }

    }
}