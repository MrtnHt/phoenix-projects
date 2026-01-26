# Maak een nieuw Python-bestand voor een weer-assistent
echo "import gradio as gr
def weather_bot(city):
    return f'De zon schijnt altijd in {city} voor een Phoenix Architect!'

demo = gr.Interface(fn=weather_bot, inputs='text', outputs='text')
demo.launch(share=True)" > weather_test.py

# Start deze nieuwe bot direct op
python weather_test.py
