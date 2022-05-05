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
        df = [self.data['Root cause High level'],
              self.data['Fixing pattern 2']]

        result = pd.concat(df, axis=1)

        categorical_dimensions = ['Root cause High level', 'Fixing pattern 2']
        dimensions = [dict(values=result[label], label=label)
                      for label in categorical_dimensions]

        dimensions[0]['label'] = 'Root Causes'
        dimensions[1]['label'] = 'Fixing Patterns'

        result["Fixing pattern 2"] = result["Fixing pattern 2"]\
            .map({'Add Checker for Null Pointer': 1, 'Add Checker for Overflow': 2,
                  'Add Checker for Recurrsion': 3, 'Add Checker for Tensors Property': 4,
                  'Add Locking Mechanism': 5, 'Avoid Stack Overflow on Deep Graphs': 6,
                  'Close File Handler': 7, 'Improve Exception Handling': 8, 'Improve String Manipulation': 9,
                  'Increase Float Precision': 10,
                  'Increase Integer Type Range': 11,
                  'Initializae Resource': 12,
                  'Memory Release Management': 13,
                  'Modify Data Type': 14,
                  'Modify Function Return Value': 15,
                  'Modify Index Calculation': 16,
                  'Modify Locking Mechanism': 17,
                  'Modify Order of Execution': 18,
                  # 'Others': 19,
                  'Remove Locking Mechansim': 19,
                  'Update API Usage': 20,
                  'Update Third Party Library': 21,
                  'Use Proper API': 22})

        color = result['Fixing pattern 2'].values

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
            font_size=15
        )

        fig.show()
        fig.write_html("./fixingpatterns.html")


def main():
    file_path = './benchmark.csv'
    data = load_csv(file_path)
    data = data[data['Root cause High level'] != 'Others']

    data = data[data['Root cause High level'] != 'others']

    data = data[data['Fixing pattern 2'] != 'Others']

    data = data[data['Fixing pattern 2'] != 'others']

    Figures(data)


if __name__ == '__main__':
    main()
