/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fxmlGUI.view;
import guiCode.FXMain;
import java.io.IOException;
import java.sql.SQLException;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
/**
 *
 * @author Anthony See
 */
public class MainViewController 
{
    /* Code for ADD! ======================================================== */  
    // Text Field FX:IDs! : Used to access the data!
    @FXML
    TextField textFieldUsername;
    @FXML
    TextField textFieldPassword;
    @FXML
    TextField textFieldUserID;
    @FXML
    TextField textFieldEmail;
    @FXML
    Button applyButton;
    
    @FXML
    private void applyButton() throws IOException, ClassNotFoundException, SQLException
    {
        // FIGURE OUT LENGTH BUGG
        String username = textFieldUsername.getText();
        String password = textFieldPassword.getText();
        String userID = textFieldUserID.getText();
        String email = textFieldEmail.getText();    
        FXMain.applyButtonADD(username,password,userID,email);
        
    }
    /* ====================================================================== */
    
    
    
    
    /* Code for Search! ***************************************************** */
    @FXML
    TextField textFieldSearch;
    @FXML
    TextArea textAreaSearch;
    
    @FXML
    private void viewAllButton() throws ClassNotFoundException, SQLException
    {
        FXMain.viewAllSEARCH(textAreaSearch);
    }
    @FXML
    private void searchButton() throws IOException, ClassNotFoundException, SQLException
    {
        String username = textFieldSearch.getText();
        FXMain.userNameSEARCH(username,textAreaSearch);
    }
    /* ********************************************************************** */
    
    
    
    
    /* Code for Delete! &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& */
    @FXML
    TextField textFieldDelete;
    
    @FXML
    private void deleteButton() throws SQLException, ClassNotFoundException
    {
        String username = textFieldDelete.getText();
        FXMain.deleteRowDELETE(username);
    }
    /* &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& */   
}
