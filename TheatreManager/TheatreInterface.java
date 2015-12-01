/* 
 * The purpose of this class is display the user interface and interactions for the Theatre Management Program 
 * Created by: Alexander Nicoara, Devanshu Bharel, Wei Shao Mei
 */

import javax.swing.*;
import java.io.*;
import javax.imageio.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;


public class TheatreInterface
{
	public TheatreInterface()
	{
		/* Setting up the JFrame stuff */
		JFrame frame = new JFrame("Theatre Manager");
		frame.setVisible(true);
		//frame.setResizable(false);
		frame.setSize(650,330);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//frame.pack();
		
		JLabel label = new JLabel("Welcome to the Ultimate Theatre Experience!");
		label.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
		
		JLabel label2 = new JLabel("\n\tGreetings! Your four options are: Login/Register, Purchase Tickets, View Forums, and Queries");
		label2.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
		
		JButton btn1 = new JButton("Login/Register");
		JButton btn2 = new JButton("Purchase Tickets");
		JButton btn3 = new JButton("View Forums");
		JButton btn4 = new JButton("Queries");
		
		
		JPanel panel = new JPanel();
		frame.add(panel);
		
		panel.add(label);
		panel.add(label2);
		
		BufferedImage myPicture = null;
		
		// the stupid image doesn't show sometimes idkw, then the buttons don't show...
		try {
			myPicture = ImageIO.read(new File("C:/Users/Alex/Desktop/movies.png"));
		}
		catch(IOException ioe) {
			System.out.println("Error.");
		}
		
		JLabel picLabel = new JLabel(new ImageIcon(myPicture));
		
		panel.add(picLabel);
		panel.add(btn1);
		panel.add(btn2);
		panel.add(btn3);
		panel.add(btn4);
		
		btn1.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) {
				System.out.println("Do Something Clicked");
			}
		});
	}
	
	public static void main(String[] args)
	{
		// creating interface
		new TheatreInterface();
	}
}
