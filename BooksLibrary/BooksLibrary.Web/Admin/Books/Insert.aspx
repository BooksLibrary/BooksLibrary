<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="BooksLibrary.Web.Admin.Books.Insert" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <fieldset>
        <legend>Add Book</legend>
        <div class="form-group">
            <label for="TitleInput" class="col-lg-2 control-label">Title</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="TitleInput" placeholder="Name" runat="server">
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="TitleInput" ErrorMessage="Book title is required." class="text-primary"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TitleInput" ValidationExpression="^.{1,50}$" runat="server" ErrorMessage="Book title must be between 1 and 50 characters!" class="text-primary"></asp:RegularExpressionValidator>
                <br />
            </div>
        </div>
        <div class="form-group">
            <label for="DescriptionInput" class="col-lg-2 control-label">Description</label>
            <div class="col-lg-10">
                <textarea class="form-control" rows="3" id="DescriptionInput" runat="server"></textarea>
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="DescriptionInput" ErrorMessage="Book title is required." class="text-primary"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="DescriptionInput" ValidationExpression="^.{5,500}$" runat="server" ErrorMessage="Book description must be between 5 and 500 characters!" class="text-primary"></asp:RegularExpressionValidator>
                <br />
            </div>
        </div>
        <div class="form-group">
            <label for="BookImageInput" class="col-lg-2 control-label">Image Url</label>
            <div class="col-lg-10">
                <input type="text" class="form-control" id="BookImageInput" placeholder="Image Url" runat="server">
                <br />
            </div>
        </div>
        <div class="form-group">
            <label for="BookAuthorInput" class="col-lg-2 control-label">Author</label>
            <div class="col-lg-10">
                <asp:DropDownList ID="BookAuthorInput" DataValueField="Id" DataTextField="Name" class="form-control" SelectMethod="GetAuthors" runat="server"></asp:DropDownList>
                <br />
            </div>
        </div>
        <div class="form-group">
            <label for="CategoryInput" class="col-lg-2 control-label">Category</label>
            <div class="col-lg-10">
                <asp:DropDownList ID="CategoryInput" DataValueField="Id" DataTextField="Name" class="form-control" SelectMethod="GetCategories" runat="server"></asp:DropDownList>
                <br />
            </div>
        </div>
        <div class="form-group">
            <label for="DescriptionInput" class="col-lg-2 control-label">File</label>
            <div class="col-lg-10">
                <asp:FileUpload runat="server" class="form-control" ID="FileInput" />
                <br />
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
