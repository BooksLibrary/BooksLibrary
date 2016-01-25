<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="All.aspx.cs" Inherits="BooksLibrary.Web.Admin.Books.All" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:ListView ID="BooksListView"
        SelectMethod="BooksListView_GetData"
        UpdateMethod="BooksListView_UpdateItem"
        DeleteMethod="BooksListView_DeleteItem"
        OnItemCanceling="BooksListView_ItemCanceling"
        ItemType="BooksLibrary.Models.Book"
        DataKeyNames="Id"
        runat="server">
        <LayoutTemplate>
            <h1>Books</h1>
            <table class="table table-striped table-hover">
                <tr id="itemPlaceholder" runat="server"></tr>
            </table>
            <asp:DataPager ID="BooksPager" runat="server" PagedControlID="BooksListView" PageSize="10" class="pagination">
                <Fields>
                    <asp:NumericPagerField ButtonType="Link" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <tr id="itemPlaceholder">
                <td>
                    <asp:LinkButton runat="Server" Text="Edit" CommandName="Edit" />
                </td>
                <td><%#: Item.Title %></td>
                <td><%#: Item.Description %></td>
                <td><%#: Item.DateAdded %></td>
                <td><a href="<%#  GetFileUrl(Item)%>"></a>File</td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="form-horizontal">
                <legend>Add New Author</legend>
                <div class="form-group">
                    <label for="TitleInput" class="col-lg-2 control-label">Title</label>
                    <div class="col-lg-10">
                        <asp:TextBox runat="server" ID="TitleInput" class="form-control" Text="<%# BindItem.Title %>"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="DescriptionInput" class="col-lg-2 control-label">Description</label>
                    <div class="col-lg-10">
                        <asp:TextBox TextMode="MultiLine" class="form-control" runat="server" ID="DescriptionInput" Text="<%#BindItem.Description %>"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="BookAuthorInput" class="col-lg-2 control-label">Author</label>
                    <div class="col-lg-10">
                        <asp:DropDownList SelectedValue="<%# BindItem.AuthorId %>" ID="BookAuthorInput" DataValueField="Id" DataTextField="Name" class="form-control" SelectMethod="GetAuthors" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="CategoryInput" class="col-lg-2 control-label">Category</label>
                    <div class="col-lg-10">
                        <asp:DropDownList SelectedValue="<%# BindItem.CategoryId %>" ID="CategoryInput" DataValueField="Id" DataTextField="Name" class="form-control" SelectMethod="GetCategories" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="DescriptionInput" class="col-lg-2 control-label">File</label>
                    <div class="col-lg-10">
                        <asp:FileUpload runat="server" class="form-control" ID="FileInput" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <asp:Button runat="server" CommandName="Update" ID="UpdateButton" Text="Update" class="btn btn-primary" />
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                        <asp:Button runat="server" CommandName="Cancel" ID="CancelButton" Text="Cancel" class="btn btn-default" />
                    </div>
                </div>

            </div>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
