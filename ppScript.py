from numpy.core.fromnumeric import resize, shape
import plotly.express as px
import pandas as pd
import numpy as np
import plotly.graph_objects as go
import matplotlib.pyplot as plt


def load_csv(file_path):
    return pd.read_csv(file_path, sep=',', header=0)


class Figures():
    def __init__(self, data) -> None:
        self.data = data
        self.cmin = -0.1
        self.cmax = 2.5

        self.adjust_layout()
        self.rootCause_to_symptom()

    def adjust_layout(self):
        df = [self.data['Root cause High level'], self.data['Symptom Vis']]

        result = pd.concat(df, axis=1)

        categorical_dimensions = ['Root cause High level', 'Symptom Vis']
        dimensions = [dict(values=result[label], label=label)
                      for label in categorical_dimensions]

        dimensions[0]['label'] = 'Root Causes'
        dimensions[1]['label'] = 'Symptoms'

        result["Symptom Vis"] = result["Symptom Vis"].map({'Segmentation Fault': 1, 'Crash': 2, 'Unexpected Behavior': 3, 'Resource Consumption': 4,
                                                           'Others': 5})

        color = result['Symptom Vis'].values

        colorscale = [[0, 'blue'], [0.33, 'red'], [0.33, 'aliceblue'], [
            0.66, 'green'], [0.66, 'black'], [1.0, 'darkcyan']]
        layout = go.Layout(
            autosize=False,
            width=1400,
            height=600,

            xaxis=go.layout.XAxis(linecolor='red',
                                  linewidth=10,
                                  mirror=True),

            yaxis=go.layout.YAxis(linecolor='black',
                                  linewidth=10,
                                  mirror=True),

            margin=go.layout.Margin(
                l=300,
                r=500,
                b=100,
                t=100,
                pad=8
            )
        )

        trace1 = go.Parcats(dimensions=dimensions,
                            line={'colorscale': colorscale, 'cmin': self.cmin, 'cmax': self.cmax, 'color': color, 'shape': 'hspline'})
        data = [trace1]

        fig = go.Figure(data=data, layout=layout)
        return fig, result, color, colorscale

    def rootCause_to_symptom(self):
        fig, result, color, colorscale = self.adjust_layout()
        colors = {
            'background': 'white',
            'text': 'black'
        }
        fig.update_layout(
            plot_bgcolor=colors['background'],
            paper_bgcolor=colors['background'],
            font_color=colors['text'],
            font_size=20
        )

        fig.show()
        fig.write_html("./rootcauseSymptom.html")


def main():
    file_path = './benchmark.csv'
    data = load_csv(file_path)

    data = data[data['Root cause High level'] != 'Others']

    data = data[data['Root cause High level'] != 'others']

    data = data[data['Symptom Vis'] != 'Others']

    data = data[data['Symptom Vis'] != 'others']
    Figures(data)


if __name__ == '__main__':
    main()
