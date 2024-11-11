from os import getenv
from dotenv import load_dotenv
import logging
from telegram import ForceReply, Update
from telegram.ext import Application, CommandHandler, ContextTypes, MessageHandler, filters, Updater, CallbackContext
import psycopg2


employees = []


logging.basicConfig(
    format='%(asctime)s %(name)s %(levelname)s %(message)s', level=logging.INFO
)
logging.getLogger("httpx").setLevel(logging.WARNING)
logger = logging.getLogger(__name__)


def getEmployeeName(tg_id):
    for user in employees:
        if tg_id == user[0]:
            return user[1]
    return None


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    employee = getEmployeeName(update.message.from_user.id)
    if not employee:
        return None
    user = update.effective_user
    await update.message.reply_html(
        rf'Привет, ' + employee + '!\nСудя по всему, ты один из нас...',
        reply_markup=ForceReply(selective=True),
    )


async def help(update: Update, context: ContextTypes.DEFAULT_TYPE): 
    if not getEmployeeName(update.message.from_user.id):
        return None
    await update.message.reply_text('Прости, помочь не могу((') 


def main():
    load_dotenv('config.env')
    token = getenv('BOT_API_KEY')
    connection_string = getenv('CONNECTION_STRING')

    conn = psycopg2.connect(connection_string)
    conn.autocommit = True
    with conn.cursor() as cursor:
        cursor.execute("""SELECT telegram_id, name FROM employees""")
        tg_id = cursor.fetchone()
        while tg_id:
            employees.append(tg_id)
            tg_id = cursor.fetchone()

    bot = Application.builder().token(token).build()
    bot.add_handler(CommandHandler('start', start))
    bot.add_handler(CommandHandler('help', help))

    bot.run_polling(allowed_updates=Update.ALL_TYPES)
    cursor.close()
    conn.close()


if __name__ == '__main__':
    main()
