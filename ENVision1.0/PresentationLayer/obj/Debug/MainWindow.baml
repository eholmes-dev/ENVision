   M S B A M L   `   `   `  ����L  HPresentationLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:PresentationLayerPresentationLayer  5   	   "    PresentationLayer.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:PresentationLayer     5   	   -   5          � Title$  
MainWindow��5   	   $	��800��6   $
��1025��6)    � WindowStartupLocation$ CenterScreen=�5	   	   
�������.��5      �  � RowDefinitions 5   
   �� 5      $��5 �6   6)   �� 5      $��80 �6   6*   �� 5      $	��600 �6   6+   �� 5      $��65 �6   6*   �� 5      6   .+�5   
   �� -   5         ��Name$ NavBar��5      $
��Left=�6%    �� TabStripPlacement$
 Left=�6@   $	��616��6Y   $��2��6g   $	��Top=�6t   $	��970��6�   .@�5      �� -   5         ��Name$ tabHome��5      $
��Home��6'   
���   �.��5      � ��5      �� 5      -   5        	imgHomeBG�� �� Opacity$	 .45Q�5   8   6H   .+�5      �� -   5         ��Name$ txtEmail��5      
��� d �$��3q�6H   
�������$��1��6r   $
��Left=�6�   $��48��6�   $��263,149,0,0q�6�   $��2��6�    �� TextWrapping$
 Wrap=�6�   $��email��6�   $��18(�6�   	 �� TextAlignment$	 Center=�6�   $��Center=�6  $	��Top=�63  $	��258��6K  G� 5      -   5        
 G�Name$
 pwdPassword��5   "   
��� d �$��3q�6O   
�������$
��Left=�6y   $��Center=�6�   $��Center=�6�   $��263,229,0,0q�6�   $��2��6�   $	��Top=�6�   $	��258��6  $��44��6   $��1��6,  �� 5      -   5         ��Name$ lblUsername��5      $��	Username:��61   
��� d �$��20(�6\   $
��Bold"�6j   $��1��6|   $
��Left=�6�   $��148,149,0,0q�6�   $��2��6�   $	��Top=�6�   $��48��6�   �� 5      -   5        $ lblUsernameInvalid��5      $y�Hidden=�68   $��Invalid��6L   $��18(�6^   $
��Bold"�6l   
���\\��$��1��6�   $
��Left=�6�   $��527,229,0,0q�6�   $��2��6�   $	��Top=�6�   $��44��6�   $	��104��6  �� 5       -	   5        $ lblPassword��5       $��	Password:��61   
��� d �$��20(�6\   $
��Bold"�6j   $��1��6|   $
��Left=�6�   $��154,229,0,0q�6�   $��2��6�   $	��Top=�6�   $��44��6�   �� 5!      -
   5        $ lblPasswordInvalid��5!      $y�Hidden=�68   $��Invalid��6L   $��18(�6^   $
��Bold"�6l   
���\\��$��1��6�   $
��Left=�6�   $��527,153,0,0q�6�   $��2��6�   $	��Top=�6�   $��44��6�   $	��104��6  �� 5"      -   5         ��Name$ btnLogin��5"      
��� d �$��Center=�6F   $��Center=�6j   
�������$
��Bold"�6�   $��16(�6�   
��� d �$��3q�6�   $��Log In��6�   $��1��6  $
��Left=�6  $��345,301,0,0q�6,  $��2��6A  $	��Top=�6N  $��89��6f  $��40��6q  6}  �� 5#      -   5        $ 
lblWelcome��5#      $y�Hidden=�60   $��Welcome��6D   $��55(�6V   $��	ExtraBold"�6d   
��� d �$��Center=�6�   $��1��6�   $
��Left=�6�   $��214,131,0,0q�6�   $��2��6�   $	��Top=�6  $	��356��6  $��93��6'  �� 5$      -   5        $ lblUserlogged��5$      $y�Hidden=�63   $��USERNAME��6G   $��Center=�6Z   $��25(�6~   $��	ExtraBold"�6�   
��� d �$��1��6�   $
��Left=�6�   $��310,248,0,0q�6�   $��2��6�   $	��Top=�6  $	��162��6  $��48��6+   5&      �� 5'      $��15 �6(   66   �� 5(      $��10 �6(   66   �� 5)      $	��550 �6(   67   �� 5*      $��15 �6(   66    � ColumnDefinitions 5-      �� 5.      $��50 �6+   68   �� 5/      $	��790 �6+   69   �� 50      $��50 �6+   68   53      54      �� 55      -   5        $ 
tabProfile��55      $��Profile��6*   
���   �$y�Hidden=�6N   .��56      � ���	#FFE5E5E5.+�57      �� $��This is the profile...��6   6?   59      5:      �� 5<      -   5        $ tabVolunteer��5<      $��	Volunteer��6,   
���   �$y�Hidden=�6R   .��5=      � ���	#FFE5E5E5$��	0,0,-21,0q�6.    5>      �� 5?      $��9.786 �6(   69   �� 5@      $��65.214 �6(   �� 5A      $	��515 �6(   67   �� 5B      $��55 �6(   66    5F      �� 5G      $��10 �6+   68   �� 5H      $	��875 �6+   69   �� 5I      $��50 �6+   68   .+�5K      &   System.Windows.Controls.DataGrid  -   5          Name$ dgVolOppList��5K         
IsReadOnly . ���#EEE8AA   SelectionMode$ Single=�5M      $
��Left=�5N      $	��451��6:   $��	10,10,0,0q�6G   $��2��6Z   $	��Top=�5O      $	��855��67   $��1��6C      	RowHeight$ 25Q�5P      6M   �� 5^      -   5        $ txt_VolOpp_Search��5^      $��1��69   $
��Left=�6I   $��31��6d   $��574,34.214,0,0q�6p   $
 Wrap=�6�   $��Search��6�   $	��Top=�6�   $	��194��6�   $��1��6�   �� 5_      -   5        $ btn_VolOpp_Search��5_      $��Go��68   $��1��6E   $
��Left=�6U   $��778,34.214,0,0q�6p   $	��Top=�6�   $��87��6�   $��31��6�   $��1��6�   �� 5`      -   5        $ btn_VolOpp_Refresh��5`      $��Refresh��69   $��1��6K   $
��Left=�6[   $��477,34.214,0,0q�6v   $	��Top=�6�   $��87��6�   $��31��6�   $��1��6�   6�   �� 5a      -   5        $ btn_VolOpp_Create��5a      $��CREATE��68   $��1��6I   $
��Left=�6Y   $��778,472,0,0q�6t   $��2��6�   $	��Top=�6�   $��86��6�   $��33��6�   6�   �� 5c      -   5        $ btn_VolOpp_Delete��5c      $y�Hidden=�68   $��Delete��6L   $��1��6]   $
��Left=�6m   $��579,472,0,0q�6�   $��2��6�   $	��Top=�6�   $��86��6�   $��33��6�   �� 5d      -   5         ��Name$ 
imgVolOpps��5d      $V��PC:\Users\ethan\OneDrive\Desktop\ENVision\ENVisionProj\ENVision1.0\volunteer2.jpg��60   $��1��6�   $
��Left=�6�   $��60��6�   $��10,5.214,0,0q�6�   $	��Top=�6�   $	��176��6�   $��1��6�   5f      5g      �� 5i      -   5        $ 	tabEvents��5i      $��Events��6)   
���   �$y�Hidden=�6L   .��5j      � ���	#FFE5E5E5 5k      �� 5m      $��75 �6(   66   �� 5n      $	��515 �6(   67   �� 5o      $��55 �6(   66    5s      �� 5t      $��10 �6+   68   �� 5u      $	��875 �6+   69   �� 5v      $��50 �6+   68   .+�5x      �� -   5         ��Name$ listView��5x      
�������$
��Left=�6B   $	��451��6]   $��	10,10,0,0q�6j   $��1��6}   $	��Top=�6�   $	��855��6�   $��1��6�    �� View 5z      �� 5{      .P�5|   "   �� $��
Event Name��61    �� Width$	 100��6E   �� 5}   "   $
��Date��61   $	 100��6?   �� 5~   "   $��Location��61   $	 150��6C   �� 5   "   $��	Organizer��61   $	 100��6D   �� 5�   "   $��Description��61   $	 400��6F   5�      5�      �� 5�      -   5        $ 	txtSearch��5�      $��1��61   $
��Left=�6A   $��31��6\   $��
574,44,0,0q�6h   $
 Wrap=�6|   $��Search��6�   $	��Top=�6�   $	��194��6�   �� 5�      -   5        $ 	btnSearch��5�      $��Go��60   $��1��6=   $
��Left=�6M   $��
778,44,0,0q�6h   $	��Top=�6|   $��87��6�   $��31��6�   �� 5�      -   5        $ btnEdit��5�      $
��Edit��6.   $��1��6=   $
��Left=�6M   $��679,472,0,0q�6h   $��1��6}   $	��Top=�6�   $��86��6�   $��33��6�   �� 5�      -   5        $ 	btnDelete��5�      $��Delete��60   $��1��6A   $
��Left=�6Q   $��778,472,0,0q�6l   $��1��6�   $	��Top=�6�   $��86��6�   $��33��6�   �� 5�      -   5        $ 	imgEvents��5�      $Y��SC:\Users\ethan\OneDrive\Desktop\ENVision\ENVisionProj\ENVision1.0\bulletinBoard.jpg��6/   $��1��6�   $
��Left=�6�   $��62��6�   $��	10,13,0,0q�6�   $	��Top=�6�   $	��193��6�   5�      5�      �� 5�      -   5        $ tabOrgs��5�      $��My Orgs��6'   
���   �$y�Hidden=�6K   .��5�      � ���	#FFE5E5E56   5�      �� 5�      -   5        $ 	tabGroups��5�      $��	My Groups��6)   
���   �$y�Hidden=�6O   .��5�      � ���	#FFE5E5E56   5�      �� 5�      -    5        $ 	tabPoints��5�      $��	My Points��6)   
���   �$y�Hidden=�6O   .��5�      � ���	#FFE5E5E56   5�      5�      �� 5�   
   -!   5        $ button��5�      $
��Exit��6!   
��� d �$��Center=�6G   $��Center=�6k   
�������$
��Bold"�6�   $��16(�6�   
��� d �$��3q�6�   $��860,14,43,0q�6�   $	��Top=�6  $��89��6  $��40��6)  $��3��65  6B  �� 5�   
   -"   5        $ sopicon��5�      $
��Left=�6!   $��52��6<   $��10,5,0,0q�6H   $	��Top=�6Z   $	��123��6r   $��1��6~   �� 5�   
   -#   5        $ 	lblFooter��5�      $E��?Contact : Phone - 3195410968 Email - ENVision@SaveThePlanet.org��6#   $
��Left=�6m   $��
307,23,0,0q�6�   $��3��6�   $	��Top=�6�   $	��412��6�   �� 5�   
   -$   5        $ lblTitle��5�      $��ENVision App��6"   $
��Left=�5�      $��	138,5,0,0q�6+   $��1��6>   $��Bottom=�5�      $	��239��6+   $��52��67   $��32(�5�      $��	ExtraBold"�6   $��Normal$�65   
��� d �5�      �� 5�   
   -%   5        $ 	btnLogout��5�      $y�Hidden=�6$   
��� d �$��Center=�6O   $��Center=�6s   
�������$
��Bold"�6�   $��16(�6�   
��� d �$��3q�6�   $��Log Out��6�   $
��Left=�6  $��
749,14,0,0q�6'  $	��Top=�6;  $��89��6S  $��40��6^  $��3��6j  6w  5�      5�      