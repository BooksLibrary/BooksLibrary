<%@ Page Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Categories.All" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Categories </h1>
    <asp:ListView ID="CategoriesListView"
        SelectMethod="CategoriesListView_GetData"
        InsertMethod="CategoriesListView_InsertItem"
        DeleteMethod="CategoriesListView_DeleteItem"
        UpdateMethod="CategoriesListView_UpdateItem"
        InsertItemPosition="LastItem"
        ItemType="BooksLibrary.Models.Category"
        DataKeyNames="Id"
        runat="server">
        <LayoutTemplate>
            <table runat="server" class="table table-striped table-hover">
                <tr runat="server" id="itemPlaceholder" />
            </table>
            <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="CategoriesListView" PageSize="5" class="pagination">
                <Fields>
                    <asp:NumericPagerField ButtonType="Link" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr runat="server">
                <td><%# Item.Name  %></td>
                <td>
                    <asp:LinkButton runat="Server" Text="Edit" CommandName="Edit" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr runat="server">
                <td>
                    <asp:TextBox runat="server" class="form-control" ID="CategoryUpdatedName" Text="<%# BindItem.Name %>"></asp:TextBox>
                </td>
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" class="btn btn-success" />
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" class="btn btn-default" />
                </td>
            </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            <td>
                <asp:TextBox runat="server" class="form-control" ID="CategoryUpdatedName" Text="<%# BindItem.Name %>"></asp:TextBox>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="CategoryUpdatedName" ValidationExpression="^.{2,10}$" runat="server" ErrorMessage="Category must be between 2 and 10 characters!" class="text-primary"></asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:Button runat="server" CommandName="Insert" Text="Insert" class="btn btn-success" />
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" class="btn btn-default" />
            </td>
        </InsertItemTemplate>
    </asp:ListView>
</asp:Content>
