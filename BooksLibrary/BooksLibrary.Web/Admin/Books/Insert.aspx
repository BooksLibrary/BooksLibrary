<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="BooksLibrary.Web.Admin.Books.Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <fieldset>
        <legend>Add New Author</legend>
        <div class="form-group">
            <label for="TitleInput" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="TitleInput" placeholder="Name" runat="server">
            </div>
        </div>
        <div class="form-group">
            <label for="DescriptionInput" class="col-lg-2 control-label">Description</label>
            <div class="col-lg-10">
                <textarea class="form-control" rows="3" id="DescriptionInput" runat="server"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="BookAuthorInput" class="col-lg-2 control-label">Author</label>
            <div class="col-lg-10">
                <asp:DropDownList ID="BookAuthorInput" DataValueField="Id" DataTextField="Name" class="form-control" SelectMethod="GetAuthors" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label for="CategoryInput" class="col-lg-2 control-label">Category</label>
            <div class="col-lg-10">
                <asp:DropDownList ID="CategoryInput" DataValueField="Id" DataTextField="Name" class="form-control" SelectMethod="GetCategories" runat="server"></asp:DropDownList>
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
                <button type="reset" class="btn btn-default" runat="server" onserverclick="Cancel">Cancel</button>
                <button type="submit" class="btn btn-primary" runat="server" onserverclick="AddBook">Submit</button>
            </div>
        </div>
    </fieldset>
</asp:Content>
