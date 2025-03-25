## PyQt5 첫 앱 개발
## Windows App = WinApp

import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *

class DevWindow(QMainWindow):       
    def __init__(self):               
        super().__init__()
        self.initUI()                                           # 화면 디자인 함수로 따로 분리

    #화면 디자인    
    def initUI(self):           
        self.setWindowTitle("My First App")                     # 윈도우 타이틀 지정
        self.setWindowIcon(QIcon('./image/database.png'))       # 이미지 폴더에 있는 database파일로 아이콘 바꿔줌
        #self.setGeometry(300, 200, 600, 350)                   # 윈도우 위치 크기 지정 x,y,w,h
        self.resize(600,350)

        # 라벨(레이블 추가)
        self.lbl1 = QLabel('버튼클릭',self)
        self.lbl1.move(10,10)                                   # 위젯 위치 조정
        self.lbl1.resize(250,30)
        
        # 버튼 추가
        self.btn1 = QPushButton('Click',self)
        self.btn1.move(10,40)
        self.btn1.clicked.connect(self.btn1click)              # 버튼 클릭 시그널(이벤트)함수 연결

        
        # 윈도우 바탕화면 정중앙에 위치
        qr = self.frameGeometry()                               # 현재 만들어진 Qt앱 위치와 크기를 받아옴
        cp = QDesktopWidget().availableGeometry().center()      # 중앙에 위치시킴
        qr.moveCenter(cp)
        self.move(qr.topLeft())

        self.show()     

    def btn1click(self):
            self.lbl1.setText('버튼을 클릭했어요')

if __name__ == '__main__' : #메인 모듈이라면
    app = QApplication(sys.argv)        
    win = DevWindow()                   
    app.exec_()                         

