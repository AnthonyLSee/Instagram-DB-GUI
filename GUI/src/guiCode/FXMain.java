// Anthony See
//
package guiCode;

import java.util.*;
import java.io.IOException;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.scene.control.TextField;
import database.instaDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FXMain extends Application 
{
    /* Code for startup! ---------------------------------------------------- */
    private Stage primaryStage;
    private AnchorPane mainLayout;
    
    @Override
    public void start(Stage primaryStage) throws IOException
    {
        this.primaryStage = primaryStage;
        this.primaryStage.setTitle("instaDB");
        showMainView();
    }
    
    private void showMainView() throws IOException
    {
        FXMLLoader loader = new FXMLLoader();
        mainLayout = FXMLLoader.load(getClass().getResource("/fxmlGUI/view/MainView.fxml"));
        Scene scene = new Scene(mainLayout);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
    /* ---------------------------------------------------------------------- */
    
    
    
    
    /* DATABASE CODE ######################################################## */
    public static Connection dbConnect() throws ClassNotFoundException, SQLException
    {
        try
        {
            String myDriver = "com.mysql.jdbc.Driver";
            String myURL = "jdbc:mysql://localhost:3306/instagramdb";
            String myUser = "root";
            String myPass = "password";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(myURL, myUser, myPass);
            return conn;
        }
        catch (Exception e)
        {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        } 
        return null;
    }
    /* ###################################################################### */
    
    
    
    
    
    /* Code for ADD! ======================================================== */
    public static void applyButtonADD(String Username, String Password,
                                      /*String Date,*/ String UserID,String Email) throws IOException, ClassNotFoundException, SQLException
    {
        Connection conn = dbConnect();  
        String query = "INSERT INTO user (id, username, password, email,dt)"
                + " VALUES(?, ?, ?, ?,?)";
        PreparedStatement preparedStmt = conn.prepareStatement(query);
        preparedStmt.setString(1, UserID);
        preparedStmt.setString(2, Username);
        preparedStmt.setString(3, Password);
        preparedStmt.setString(4, Email);
        preparedStmt.setInt(5, 0);
        
        System.out.println("QUERY: "+ query);
        /* Recieves all textfields and adds to database! */
        //System.out.println(Username + " " + Password + " " + Date + " " + UserID);
        preparedStmt.execute();
        
        conn.close();
    }
    /* ====================================================================== */
    
    
    
    
    /* Code for Search! ***************************************************** */
    public static void addTextSEARCH(Connection conn, TextArea textArea, String query) throws ClassNotFoundException, SQLException
    {
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        while (rs.next())                       /* Printing! */
        {
            String userName = rs.getString("username");
            int userID = rs.getInt("id");
            String userEmail = rs.getString("email");
            //java.sql.Date date = rs.getDate("dt");
            String userPassword = rs.getString("password");
            String returnText = userID + " | " + userName + " | " + userEmail + " | " + userPassword + "\n";
            textArea.appendText(returnText);
        }
        st.close();
    }
    
    public static void userNameSEARCH(String Username, TextArea textArea) throws ClassNotFoundException, SQLException
    {   // ONLY FOR USERNAMES!
        if(textArea.getText().trim().length() != 0) textArea.clear();
        textArea.appendText("Data for : " + Username + "\n");
        Connection conn = dbConnect();  
        String query = "SELECT * FROM instagramdb.user "
                + "WHERE instagramdb.user.username = '" + Username + "';";
        System.out.println("QUERY: "+ query);
        addTextSEARCH(conn,textArea,query);
        conn.close();
    }
    
    public static void viewAllSEARCH(TextArea textArea) throws ClassNotFoundException, SQLException
    {
        if(textArea.getText().trim().length() != 0) textArea.clear();
        Connection conn = dbConnect();
        String query = "SELECT * FROM instagramdb.user;";
        System.out.println("QUERY: "+ query);
        addTextSEARCH(conn,textArea,query);
        conn.close();
    }
    /* ********************************************************************** */
    
    
    
    
    /* Code for Delete! &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& */
    public static void deleteRowDELETE(String username) throws SQLException, ClassNotFoundException
    {
        Connection conn = dbConnect();  
        String query = "DELETE FROM user WHERE username = ?";
        PreparedStatement preparedStmt = conn.prepareStatement(query);
        preparedStmt.setString(1,username);

        System.out.println("QUERY: "+ query);
        /* Recieves all textfields and adds to database! */
        preparedStmt.execute();
        
        conn.close();   
    }
    /* &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& */
    
    public static void main(String[] args) {
        launch(args);
    }
    
}
