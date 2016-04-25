using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void NavigationMenu_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        System.Web.UI.WebControls.Menu menu = (System.Web.UI.WebControls.Menu)sender;
        SiteMapNode mapNode = (SiteMapNode)e.Item.DataItem;

        // Switch between Client Area and My Account menu items when the user login/logout
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            if (mapNode.Title == "Client Area")
            {
                System.Web.UI.WebControls.MenuItem itemToRemove = menu.FindItem(mapNode.Title);
                menu.Items.Remove(itemToRemove);
            }
        }
        else
        {
            if (mapNode.Title == "My Account")
            {
                System.Web.UI.WebControls.MenuItem itemToRemove = menu.FindItem(mapNode.Title);
                menu.Items.Remove(itemToRemove);
            }
        }

        // Set selected menu class to currently active menu item
        if (SiteMap.CurrentNode != null)
        {
            if (e.Item.Text == SiteMap.CurrentNode.Title)
            {
                if (e.Item.Parent != null)
                {
                    e.Item.Parent.Selected = true;
                }
                else
                {
                    e.Item.Selected = true;
                }
            }
        }
    }
}
