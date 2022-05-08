<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration - About</title>
    <link rel="stylesheet" href="css/about.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">
    <div class="head-container">
        <h1>About Us</h1>
        <h5>Learn more about us!</h5>
    </div>

    <div style="display: flex; justify-content: center;">
        <div id="about-container">
            <h3>Our History</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc in quam non elit euismod euismod. Mauris
                ultricies leo sit amet quam suscipit, ut sollicitudin eros eleifend. Integer ultrices facilisis orci
                vitae tincidunt. Pellentesque quis tortor eu orci consequat consequat. Phasellus in semper purus, eget
                ullamcorper lacus. Sed feugiat ligula et libero finibus sagittis. Integer ut augue vitae nibh semper
                molestie. Fusce quis pulvinar ipsum. Cras tincidunt at enim a porttitor. Praesent vel neque sapien.
                Nullam vulputate mauris sed mauris semper varius. Suspendisse eu dignissim augue, sed imperdiet odio.
                Vivamus malesuada eros bibendum convallis hendrerit. Integer et sapien quis dolor lobortis fringilla
                vulputate non massa. Duis eget urna mattis, vehicula nulla tincidunt, dignissim velit. Sed congue,
                mauris ut tincidunt auctor, urna dolor semper augue, vitae scelerisque eros velit sed ligula.</p>
            <h3>Our Love for Luxury Cars</h3>
            <p>Duis aliquam in urna a rhoncus. Maecenas accumsan purus vitae velit rhoncus feugiat. Ut faucibus augue
                diam, et rutrum diam suscipit sit amet. Morbi sollicitudin felis quis venenatis sodales. In rhoncus, est
                nec mollis sollicitudin, libero nisi luctus lectus, interdum pretium elit sapien quis justo. Mauris
                maximus quam nec mattis tristique. Phasellus sit amet urna ut lorem ornare dictum ac quis ex. Aliquam
                sodales ligula eget maximus laoreet. Sed vestibulum lectus augue, eget laoreet velit lobortis eu.</p>
        </div>
    </div>
</asp:Content>