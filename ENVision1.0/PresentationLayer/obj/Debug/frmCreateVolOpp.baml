   M S B A M L   `   `   `  ����L  HPresentationLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:PresentationLayerPresentationLayer  5   	   '    !PresentationLayer.frmCreateVolOpp   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:PresentationLayer     5   	     � Title$"  Create Volunteer Opprotunity��5   	    � WindowStartupLocation$ CenterScreen=�5	   	   $	��400��5
   	   $	��500��6   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��150 �6   6-   �� 5      $	��300 �6   6-    � RowDefinitions 5   
   �� 5      -   5         ��Name$
 Row1��5      $��75 �6*   68   �� 5      -   5        $
 Row2��5      $��35 �6*   68   �� 5      -   5        $
 Row3��5      $��35 �6*   68   �� 5      -   5        $
 Row4��5      $��35 �6*   68   �� 5      -   5        $
 Row5��5      $��35 �6*   68   �� 5      -   5        $
 Row6��5      $	��140 �6*   69   .+�5   
   �� -   5         ��Name$ lblVolOppName��5      $��Volunteer Opp Name��6'   $��Right=�6D   $��0,5,10,0q�6`   $��1��6r   $	��Top=�6   $��Right=�6�   $��25��6�   $	��130��6�   �� 5   
   -   5        $ lblEventDate��5      $
��Date��6&   $��Right=�65   $��0,5,10,0q�6Q   $��2��6c   $	��Top=�6p   $��Right=�6�   $��25��6�   $��91��6�   �� 5   
   -	   5        $ lblEventLocation��5      $��Location��6*   $��Right=�6=   $��0,5,10,0q�6Y   $��3��6k   $	��Top=�6x   $��Right=�6�   $��25��6�   $��91��6�   �� 5   
   -
   5        $ lblEventOrganizer��5      $��	Organizer��6+   $��Right=�6?   $��0,5,10,0q�6[   $��4��6m   $	��Top=�6z   $��Right=�6�   $��25��6�   $��91��6�   �� 5   
   -   5        $ lblEventDescription��5      $��Description��6-   $��Right=�6C   $��0,5,10,0q�6_   $��5��6q   $	��Top=�6~   $��Right=�6�   $��25��6�   $��91��6�   �� 5   
   -   5         ��Name$ txtCreateVolOppName��5      $��1��60   $
��Left=�6@   $��23��6[   $��65,7,0,0q�6g   $��1��6y    �� TextWrapping$
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��181��6�   �� 5    
   -   5        $ txtCreateVolOppLocation��5       $��1��64   $
��Left=�6D   $��23��6_   $��65,7,0,0q�6k   $��3��6}   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��181��6�   �� 5!   
   -   5        $ txtCreateVolOppOrganizer��5!      $��1��65   $
��Left=�6E   $��23��6`   $��65,7,0,0q�6l   $��4��6~   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��181��6�   �� 5"   
   -   5        $  txtCreateVolOppDescription��5"      $��1��67   $
��Left=�6G   $��65��6b   $��	65,10,0,0q�6n   $��5��6�   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��181��6�   �� 5#   
   -   5        $ txtCreateVolOppDate��5#      $��1��60   $
��Left=�6@   $��81��6[   $��	65,10,0,0q�6g   $��2��6z   $
 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��181��6�   �� 5$   
   $��Required��6   $y�Hidden=�6#   $��1��67   $
��Left=�6G   $��264,7,-30,0q�6b   $��1��6w   $	��Top=�6�   $��67��6�   $��23��6�   ���	#FFF904046�   �� 5%   
   $��Required��6   $y�Hidden=�6#   $��1��67   $
��Left=�6G   $��264,7,-30,0q�6b   $��2��6w   $	��Top=�6�   $��67��6�   $��23��6�   ���	#FFF904046�   �� 5&   
   $��Required��6   $y�Hidden=�6#   $��1��67   $
��Left=�6G   $��264,7,-30,0q�6b   $��3��6w   $	��Top=�6�   $��67��6�   $��23��6�   ���	#FFF904046�   �� 5'   
   $��Required��6   $y�Hidden=�6#   $��1��67   $
��Left=�6G   $��264,7,-30,0q�6b   $��4��6w   $	��Top=�6�   $��67��6�   $��23��6�   ���	#FFF904046�   �� 5(   
   $��Required��6   $y�Hidden=�6#   $��1��67   $
��Left=�6G   $��264,7,-30,0q�6b   $��5��6w   $	��Top=�6�   $��67��6�   $��23��6�   ���	#FFF904046�   �� 5)   
   -   5        $ 	editOppId��5)      $y�Hidden=�6%   $
��Left=�69   $��23��6T   $��	21,90,0,0q�6`   $��5��6s   $
 Wrap=�6�   $��TextBox��6�   $	��Top=�6�   $	��120��6�   �� 5*   
   -   5         ��Name$ btnCreateVolOpp��5*   &   $y�Visible=�6   $��Create��6?   $��1��6P   $
��Left=�6`   $��
160,90,0,0q�6{   $��5��6�   $	��Top=�6�   $��86��6�   $��31��6�   6�   5+      5,      