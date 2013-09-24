using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrafficDey
{
    public partial class td : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ToggleLoginMode()
        {
            //toggles the login mode between login and new account
            if (radReturnUser.Checked)
            {
                //login mode
                pnlLogin.Visible = true;
                btnLogin.Visible = true;
                pnlCreate.Visible = false;
                btnNewAcc.Visible = false;
            }
            else if (radNewUser.Checked)
            {
                //new account mode
                pnlCreate.Visible = true;
                btnNewAcc.Visible = true;
                pnlLogin.Visible = false;
                btnLogin.Visible = false;
            }
        }

        protected void radReturnUser_CheckedChanged(object sender, EventArgs e)
        {
            ToggleLoginMode();
        }

        protected void radNewUser_CheckedChanged(object sender, EventArgs e)
        {
            ToggleLoginMode();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //redirect to check traffic page with location as querystring
            //TODO: clean up user input
            //TODO: append NIGERIA
            //TODO: Check empty textbox
            if (!String.IsNullOrEmpty(txtTrafficLocation.Text))
            {
                Response.Redirect("~/checktraffic.aspx?loc=" + txtTrafficLocation.Text);
            }
        }
    }
}