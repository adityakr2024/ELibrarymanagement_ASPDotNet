using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    lBtnUserLogin.Visible = true;
                    lBtnSignUp.Visible = true;
                    lBtnAdminLogin.Visible = true;
                    lBtnLogout.Visible = false;
                    lBtnHelloUser.Visible = false;
                    lBtnAuthorMgmt.Visible = false;
                    lBtnPublisherMgmg.Visible = false;
                    lbtnBookInventory.Visible = false;
                    lBtnBookIssuing.Visible = false;
                    lBtnMemberMgmt.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    lBtnUserLogin.Visible = false;
                    lBtnSignUp.Visible = false;
                    lBtnAdminLogin.Visible = true;
                    lBtnLogout.Visible = true;
                    lBtnHelloUser.Visible = true;
                    //lBtnHelloUser.Text = "Hello " + Session["user"].ToString();
                    //lBtnHelloUser.Text = "Hello " + (Session["user"] != null ? Session["user"].ToString() : "User");
                    if (Session["username"] != null)
                    {
                        lBtnHelloUser.Text = "Hello " + Session["username"].ToString();
                    }
                    else
                    {
                        lBtnHelloUser.Text = "Hello User";
                    }

                    lBtnAuthorMgmt.Visible = false;
                    lBtnPublisherMgmg.Visible = false;
                    lbtnBookInventory.Visible = false;
                    lBtnBookIssuing.Visible = false;
                    lBtnMemberMgmt.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    lBtnUserLogin.Visible = false;
                    lBtnSignUp.Visible = false;
                    lBtnAdminLogin.Visible = false;
                    lBtnLogout.Visible = true;
                    lBtnHelloUser.Visible = true;
                    lBtnHelloUser.Text = "Hello Admin";
                    lBtnAuthorMgmt.Visible = true;
                    lBtnPublisherMgmg.Visible = true;
                    lbtnBookInventory.Visible = true;
                    lBtnBookIssuing.Visible = true;
                    lBtnMemberMgmt.Visible = true;
                }
            }
            catch(Exception ex)
            {
                // Display an error message to the user
                Response.Write("<script>alert('An error occurred. Please try again later.');</script>");

                // Optionally log the error (in a real application, consider logging to a file or database)
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
            
        }

        protected void lBtnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin-login.aspx");
        }

        protected void lBtnAuthorMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminauthormanagement.aspx");
        }

        protected void lBtnPublisherMgmg_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminpublishermanagement.aspx");
        }

        protected void lbtnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminbookinventory.aspx");
        }

        protected void lBtnBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminbookissuing.aspx");
        }

        protected void lBtnMemberMgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminmembermanagement.aspx");
        }

        protected void lBtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/usersignup.aspx");
        }

        protected void lBtnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user-login.aspx");
        }

        protected void lBtnLogout_Click(object sender, EventArgs e)
        {
            //Session["username"] = dr.GetValue(8).ToString();
            //Session["fullname"] = dr.GetValue(0).ToString();
            //Session["role"] = "user";
            //Session["status"] = dr.GetValue(10).ToString();

            // Clear session variables
            Session.Clear();

            // Optionally, abandon the session
            Session.Abandon();

            // Redirect to the login page or homepage
            Response.Redirect("~/homepage.aspx"); // or your desired page

            lBtnUserLogin.Visible = true;
            lBtnSignUp.Visible = true;
            lBtnAdminLogin.Visible = true;
            lBtnLogout.Visible = false;
            lBtnHelloUser.Visible = false;
            lBtnAuthorMgmt.Visible = false;
            lBtnPublisherMgmg.Visible = false;
            lbtnBookInventory.Visible = false;
            lBtnBookIssuing.Visible = false;
            lBtnMemberMgmt.Visible = false;
        }
    }
}