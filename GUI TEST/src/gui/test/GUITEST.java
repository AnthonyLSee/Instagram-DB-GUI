
package gui.test;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

/**
 *
 * @author Anthony See
 */
public class GUITEST extends Application 
{
    /* Termimonlgy
    *
    *
    */
    Button buttonAdd;
    public static void main(String[] args)
    {
        launch(args);                       // Call method -> Calls Application
    }
    
    
    @Override
    public void start(Stage primaryStage) throws Exception
    {
        primaryStage.setTitle("instaDB");
        buttonAdd = new Button("Add");
        
        StackPane layout = new StackPane();
        layout.getChildren().add(buttonAdd);
        
        Scene scene = new Scene(layout,300,300);
        primaryStage.setScene(scene);
        primaryStage.show();
        
    }
}

