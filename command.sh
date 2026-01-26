# 1. Stop eventuele andere bots (optioneel, maar slim)
pkill -f python

# 2. Herschrijf het bestand voor de zekerheid (zodat je zeker weet dat de code klopt)
echo "import gradio as gr
def weather_bot(city):
    return f'De zon schijnt altijd in {city} voor een Phoenix Architect!'

demo = gr.Interface(fn=weather_bot, inputs='text', outputs='text')
demo.launch(share=True)" > weather_test.py

# 3. Start de motor
python weather_test.py
