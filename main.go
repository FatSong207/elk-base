package main

import (
	"log"
	"os"
	"time"
)

func main() {
	// 確保日誌目錄存在
	os.MkdirAll("/app/logs", 0755)

	// 設定日誌檔案
	logFile, err := os.OpenFile("/app/logs/app.log", os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	if err != nil {
		log.Fatal("無法開啟日誌檔案:", err)
	}
	defer logFile.Close()

	// 設定日誌輸出到檔案
	log.SetOutput(logFile)

	// 無限循環產生日誌
	for {
		log.Printf("應用程式日誌: 時間戳 %v", time.Now().Format(time.RFC3339))
		time.Sleep(5 * time.Second)
	}
}
