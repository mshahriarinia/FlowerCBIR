






import java.awt.*;
import javax.swing.*;

public class JFrameExample {
  public static void main(String[] args) {
    WindowUtilities.setNativeLookAndFeel();
    JFrame f = new JFrame("This is a test");
    f.setSize(400, 150);
    Container content = f.getContentPane();
    content.setBackground(Color.white);
    content.setLayout(new FlowLayout()); 
    content.add(new JButton("Button 1"));
    content.add(new JButton("Button 2"));
    content.add(new JButton("Button 3"));
    f.addWindowListener(new ExitListener());
    f.setVisible(true);
  }
}