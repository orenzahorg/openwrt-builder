#!/usr/bin/env python3
import os
import sys
import logging
import subprocess
import shutil

def run_command(command: list[str], cwd: str = None):
    result = subprocess.run(command, shell=True, capture_output=True, text=True, cwd=cwd)
    logging.info(f"Command: {command} executed with result: {result.stdout}")
    return result.stdout, result.stderr

def setup_logging():
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def main():
    setup_logging()
    logging.info("Script started")

    # check if openwrt directory exists
    logging.info("Checking if openwrt directory exists")
     
    home_dir = os.path.expanduser("~")
    if not os.path.exists(f"{home_dir}/openwrt-bkp"):
        logging.error("openwrt directory does not exist")
        run_command(["git", "clone", "https://github.com/openwrt/openwrt.git"])
    else:
        logging.info("openwrt directory exists")
        shutil.copytree(f"{home_dir}/openwrt-bkp", "openwrt")
    # check if mtk-openwrt-feeds directory exists
    # git clone https://git01.mediatek.com/openwrt/feeds/mtk-openwrt-feeds mtk-openwrt-feeds
    logging.info("Checking if mtk-openwrt-feeds directory exists")
    if not os.path.exists(f"{home_dir}/mtk-openwrt-feeds-bkp"):
        logging.error("mtk-openwrt-feeds directory does not exist")
        run_command(["git", "clone", "https://git01.mediatek.com/openwrt/feeds/mtk-openwrt-feeds", "mtk-openwrt-feeds"])
    else:
        logging.info("mtk-openwrt-feeds directory exists")
        shutil.copytree(f"{home_dir}/mtk-openwrt-feeds-bkp", "mtk-openwrt-feeds")

    
    
    
    

if __name__ == "__main__":
    main()