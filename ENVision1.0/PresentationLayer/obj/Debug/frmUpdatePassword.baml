   M S B A M L   `   `   `  ����L  HPresentationLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:PresentationLayerPresentationLayer  5   	   )    #PresentationLayer.frmUpdatePassword   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:PresentationLayer     5   	     � WindowStartupLocation$  CenterScreen=�5      
������� � Title$ Change Password��5	   	   $	��300��6!   $	��450��6.   .��5
      �  � RowDefinitions 5   
   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      $	��225 �6   6-   �� 5      6!   .+�5   
   �� -   5         ��Name$ lblCurrentPassword��5      $��0��5      $��1��6    $��Center=�5      $��Right=�5      $��Current Password:��5      $��Center=�5      $��Right=�5      $
��10 0q�5      $��DemiBold"�5      �� 5    
   -   5        $ lblNewPassword��5       $��0��5!      $��2��6    $��Center=�5"      $��Right=�5#      $��New Password:��5$      $��Center=�5%      $��Right=�5&      $
��10 0q�5'      $��DemiBold"�5(      �� 5)   
   -   5        $ lblRetypePassword��5)      $��0��5*      $��3��6    $��Center=�5+      $��Right=�5,      $��Re-Enter Password:��5-      $��Center=�5.      $��Right=�5/      $
��10 0q�50      $��DemiBold"�51      �� 52   
   -   5         ��Name$ 	btnSubmit��52      $��1��53      $��5��6!   $��Submit��54      $
��Left=�55      $��5q�56      $
��10 5q�6   $��DemiBold"�57      6'   G� 58   
   -   5         G�Name$ pwdCurrentPassword��58      $��1��59      $��1��6&   $	��120��5:      $��30��6"   $��5q�5;      $��Center=�5<      $��Center=�5=      $
��Left=�5>      G� 5?   
   -   5        $ pwdNewPassword��5?      $��1��5@      $��2��6&   $	��120��5A      $��30��6"   $��5q�5B      $��Center=�5C      $��Center=�5D      $
��Left=�5E      G� 5F   
   -   5        $ pwdRetypePassword��5F      $��1��5G      $��3��6&   $	��120��5H      $��30��6"   $��5q�5I      $��Center=�5J      $��Center=�5K      $
��Left=�5L      5M      5N      