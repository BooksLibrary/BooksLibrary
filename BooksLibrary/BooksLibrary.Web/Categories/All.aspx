<%@ Page Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Categories.All" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="CategoriesListView"
        OnItemEditing="CategoriesListView_ItemEditing"
        OnItemUpdating="CategoriesListView_ItemUpdating"
        OnItemCanceling="CategoriesListView_ItemCanceling" EnableModelValidation="true">
        <LayoutTemplate>
            <asp:LinkButton runat="server" ID="SortButton"
                Text="Sort" CommandName="Sort" CommandArgument="Name" />
            <table runat="server" id="table1">
                <tr runat="server" id="itemPlaceholder">
                </tr>
            </table>
            <asp:DataPager runat="server" ID="DataPager" PageSize="2">
                <Fields>
                    <asp:NumericPagerField ButtonCount="2"
                        PreviousPageText="<--"
                        NextPageText="-->" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#Eval("Name") %></td>
                <td>
                    <asp:LinkButton runat="Server" Text="Edit" CommandName="Edit" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="CategoryUpdatedName" Text=""></asp:TextBox>
                </td>
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Ok" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
