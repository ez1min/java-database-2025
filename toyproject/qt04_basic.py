## PyQt5 첫 앱 개발
## Windows App = WinApp

import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *

class DevWindow(QMainWindow):       
    def __init__(self):               
        super().__init__()
        self.initUI()                                         

    #화면 디자인    
    def initUI(self):           
        self.setWindowTitle("My First App")                    
        self.setWindowIcon(QIcon('./image/database.png'))                        
        self.resize(600,350)

        # 라벨(레이블 추가)
        self.lbl1 = QLabel('버튼클릭',self)
     
        # 버튼 추가
        self.btn1 = QPushButton('Click',self)
        self.btn1.clicked.connect(self.btn1click)

        self.hbox = QHBoxLayout()                               # 가로로 구성하는 레이아웃
        self.hbox.addStretch(1)                                 # 여유공백
        self.hbox.addWidget(self.lbl1)
        self.hbox.addWidget(self.btn1)
        self.hbox.addStretch(1)

        self.vbox = QHBoxLayout()                               # 세로로 구성하는 레이아웃
        
        self.setLayout(self.hbox)                               # 윈도우에 레이아웃 추가




       # 윈도우 바탕화면 정중앙에 위치
        qr = self.frameGeometry()                               
        cp = QDesktopWidget().availableGeometry().center()      
        qr.moveCenter(cp)
        self.move(qr.topLeft())

        self.show()     

    def btn1click(self):
            QMessageBox.about(self,'버튼을 클릭했어요')

if __name__ == '__main__' : 
    app = QApplication(sys.argv)        
    win = DevWindow()                   
    app.exec_()                         

