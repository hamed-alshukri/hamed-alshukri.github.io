using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class my_account_account : System.Web.UI.MasterPage
{
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


        string thispage = this.Page.AppRelativeVirtualPath;
        int slashpos = thispage.LastIndexOf('/');
        string pagename = thispage.Substring(slashpos + 1);


        foreach (MenuItem mi in Menu2.Items)
        {
            if (mi.NavigateUrl.Contains(pagename))
            {
                mi.Selected = true;
                break;
            }
        }
    }
}
